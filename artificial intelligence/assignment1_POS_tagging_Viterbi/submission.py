from operator import itemgetter				#this functionality is NOT needed. It may help slightly, but you can definitely ignore it completely.

#DO NOT CHANGE!
def read_train_file():
	'''
	HELPER function: reads the training files containing the words and corresponding tags.
	Output: A tuple containing 'words' and 'tags'
	'words': This is a nested list - a list of list of words. See it as a list of sentences, with each sentence itself being a list of its words.
	For example - [['A','boy','is','running'],['Pick','the','red','cube'],['One','ring','to','rule','them','all']]
	'tags': A nested similar to above, just the corresponding tags instead of words. 
	'''						
	f = open('train','r')
	words = []
	tags = []
	lw = []
	lt = []
	for line in f:
		s = line.rstrip('\n')
		w,t= s.split('/')[0],s.split('/')[1]
		if w=='###':
			words.append(lw)
			tags.append(lt)
			lw=[]
			lt=[]
		else:
			lw.append(w)
			lt.append(t)
	words = words[1:]
	tags = tags[1:]
	assert len(words) == len(tags)
	f.close()
	return (words,tags)








#NEEDS TO BE FILLED!
def train_func(train_list_words, train_list_tags):

	dict2_word_tag = {}
	dict2_tag_follow_tag= {}
	'''
	This creates dictionaries storing the transition and emission probabilities - required for running Viterbi. 
	INPUT: The nested list of words and corresponding nested list of tags from the TRAINING set. This passing of correct lists and calling the function
	has been done for you. You only need to write the code for filling in the below dictionaries. (created with bigram-HMM in mind)
	OUTPUT: The two dictionaries

	HINT: Keep in mind the boundary case of the starting POS tag. You may have to choose (and stick with) some starting POS tag to compute bigram probabilities
	for the first actual POS tag.

	'''

	"""Nested dictionary to store the transition probabilities
    each tag X is a key of the outer dictionary with an inner dictionary as the corresponding value
    The inner dictionary's key is the tag Y following X
    and the corresponding value is the number of times Y follows X - convert this count to probabilities finally before returning 
    """
	
	"""Nested dictionary to store the emission probabilities.
	Each word W is a key of the outer dictionary with an inner dictionary as the corresponding value
	The inner dictionary's key is the tag X of the word W
	and the corresponding value is the number of times X is a tag of W - convert this count to probabilities finally before returning
	"""


	#      *** WRITE YOUR CODE HERE ***    

	###########################################
	cnt={}
	allwords=[]
	alltags=[]
	temp=1
	
	for line in train_list_words:
		for word in line:
			allwords.append(word)

	for linetag in train_list_tags:
		for tag in linetag:
			alltags.append(tag)
			if tag not in cnt:
				cnt[tag]=1
			else:
				cnt[tag]+=1
	num_tags=len(set(alltags))
	# print(num_tags)
	#two lists created one of words and other of tag in respective order
	###################################################################
	#calculate the transition and emission probability
	for i in range(len(allwords)-1):
		tag1=alltags[i]
		tag2=alltags[i+1]
		if tag1 in dict2_tag_follow_tag.keys():
			if tag2 in dict2_tag_follow_tag[tag1].keys():
				dict2_tag_follow_tag[tag1][tag2]+=1
			else:
				dict2_tag_follow_tag[tag1][tag2]=1
		else:
			dict2_tag_follow_tag[tag1]={}
			dict2_tag_follow_tag[tag1][tag2]=1
		tag1=allwords[i]
		tag2=alltags[i]
		
		if tag1 in dict2_word_tag.keys():
			if tag2 in dict2_word_tag[tag1].keys():
				dict2_word_tag[tag1][tag2]+=1
			else:
				dict2_word_tag[tag1][tag2]=1
		else:
			dict2_word_tag[tag1]={}
			dict2_word_tag[tag1][tag2]=1

	for i in dict2_tag_follow_tag:
		for j in dict2_tag_follow_tag[i]:
			dict2_tag_follow_tag[i][j]=(dict2_tag_follow_tag[i][j]+temp)/(cnt[i]+temp*num_tags)

	for i in dict2_word_tag:
		for j in dict2_word_tag[i]:
			dict2_word_tag[i][j]=dict2_word_tag[i][j]/cnt[j]


	##########################################################
	# END OF YOUR CODE	

	return (dict2_tag_follow_tag, dict2_word_tag)



def assign_POS_tags(test_words, dict2_tag_follow_tag, dict2_word_tag):
	output_test_tags=[]
	linetag=[]
	taglist=[]
	for tag in dict2_tag_follow_tag.keys():
		taglist.append(tag)
	words=[]
	for word in dict2_word_tag.keys():
		words.append(word)
	
	for line in test_words:
		a={}
		for tag in dict2_tag_follow_tag.keys():
			a[tag]={}
		for i in range(len(line)):
			

			for tag in a.keys():
				a[tag][i]=(0,'N')
			
			
			if line[i] not in words:
				for j in range(len(line[i])):
					if ord(line[i][j])>=48 and ord(line[i][j])<=57:
						dict2_word_tag[line[i]]={}
						dict2_word_tag[line[i]]['C']=1
			if line[i] not in words and line[i] not in dict2_word_tag.keys():
				dict2_word_tag[line[i]]={}
				dict2_word_tag[line[i]]['N']=1000
			if(i==0):
				for tag1 in taglist:
					if tag1 in dict2_tag_follow_tag['.'].keys():
						if tag1 in dict2_word_tag[line[0]].keys():
							a[tag1][0]=(dict2_tag_follow_tag['.'][tag1]*dict2_word_tag[line[0]][tag1],'.')
					else:
						a[tag1][0]=(0,'.')

			else:
				for tag1 in taglist:
					for tag2 in taglist:
						if tag1 in dict2_tag_follow_tag[tag2].keys() and tag2 in dict2_tag_follow_tag.keys():
							if tag1 in dict2_word_tag[line[i]].keys():
								prob=a[tag2][i-1][0]*dict2_tag_follow_tag[tag2][tag1]*dict2_word_tag[line[i]][tag1]
								if(prob>=a[tag1][i][0]):
									a[tag1][i]=(prob,tag2)


		finaltag='N'
		finalprob=0
		for tag in taglist:
			if(a[tag][len(line)-1][0]>finalprob):
				finalprob=a[tag][len(line)-1][0]
				finaltag=tag
		linetag.append(finaltag)
		finaltag=a[finaltag][len(line)-1][1]
		for i in range(len(line)-2,-1,-1):
			linetag.insert(0,finaltag)
			finaltag=a[finaltag][i][1]
		output_test_tags.append(linetag)
		linetag=[]





	return output_test_tags
# DO NOT CHANGE!
def public_test(predicted_tags):
	'''
	HELPER function: Takes in the nested list of predicted tags on test set (prodcuced by the assign_POS_tags function above)
	and computes accuracy on the public test set. Note that this accuracy is just for you to gauge the correctness of your code.
	Actual performance will be judged on the full test set by the TAs, using the output file generated when your code runs successfully.
	'''

	f = open('test_public_labeled','r')
	words = []
	tags = []
	lw = []
	lt = []
	for line in f:
		s = line.rstrip('\n')
		w,t= s.split('/')[0],s.split('/')[1]
		if w=='###':
			words.append(lw)
			tags.append(lt)
			lw=[]
			lt=[]
		else:
			lw.append(w)
			lt.append(t)
	words = words[1:]
	tags = tags[1:]
	assert len(words) == len(tags)
	f.close()
	public_predictions = predicted_tags[:len(tags)]
	assert len(public_predictions)==len(tags)

	correct = 0
	total = 0
	flattened_actual_tags = []
	flattened_pred_tags = []
	for i in range(len(tags)):
		x = tags[i]
		y = public_predictions[i]
		if len(x)!=len(y):
			print(i)
			print(x)
			print(y)
			break
		flattened_actual_tags+=x
		flattened_pred_tags+=y
	assert len(flattened_actual_tags)==len(flattened_pred_tags)
	correct = 0.0
	for i in range(len(flattened_pred_tags)):
		if flattened_pred_tags[i]==flattened_actual_tags[i]:
			correct+=1.0
	print('Accuracy on the Public set = '+str(correct/len(flattened_pred_tags)))



# DO NOT CHANGE!
def evaluate():
	words_list_train = read_train_file()[0]
	tags_list_train = read_train_file()[1]

	dict2_tag_tag = train_func(words_list_train,tags_list_train)[0]
	dict2_word_tag = train_func(words_list_train,tags_list_train)[1]

	f = open('test_full_unlabeled','r')

	words = []
	l=[]
	for line in f:
		w = line.rstrip('\n')
		if w=='###':
			words.append(l)
			l=[]
		else:
			l.append(w)
	f.close()
	words = words[1:]
	test_tags = assign_POS_tags(words, dict2_tag_tag, dict2_word_tag)
	assert len(words)==len(test_tags)

	public_test(test_tags)

	#create output file with all tag predictions on the full test set

	f = open('output','w')
	f.write('###/###\n')
	for i in range(len(words)):
		sent = words[i]
		pred_tags = test_tags[i]
		for j in range(len(sent)):
			word = sent[j]
			pred_tag = pred_tags[j]
			f.write(word+'/'+pred_tag)
			f.write('\n')
		f.write('###/###\n')
	f.close()

	print('OUTPUT file has been created')

if __name__ == "__main__":
	evaluate()

