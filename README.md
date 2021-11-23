For Developers
============
You can also see [Java](https://github.com/starlangsoftware/Corpus), [Python](https://github.com/starlangsoftware/Corpus-Py), [Cython](https://github.com/starlangsoftware/Corpus-Cy), [C#](https://github.com/starlangsoftware/Corpus-CS), [Js](https://github.com/starlangsoftware/Corpus-Js), or [C++](https://github.com/starlangsoftware/Corpus-CPP) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called Corpus-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/Corpus-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run Corpus-Swift.

Detailed Description
============

+ [Corpus](#corpus)
+ [TurkishSplitter](#turkishsplitter)

## Corpus

To store a corpus in memory

	a = Corpus(fileName: "derlem.txt")

If this corpus is split with dots but not in sentences

	init(fileName: String, sentenceSplitter: SentenceSplitter)

To eliminate the non-Turkish sentences from the corpus

	init(fileName: String, languageChecker: LanguageChecker)

The number of sentences in the corpus

	func sentenceCount() -> Int

To get ith sentence in the corpus

	func getSentence(index: Int) -> Sentence

## TurkishSplitter

TurkishSplitter class is used to split the text into sentences in accordance with the . rules of Turkish.

	func split(line: String) -> [Sentence]
