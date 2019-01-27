---
layout: questions
title: "Some intro questions..."
button: next page
pageNo: 1
---
Questions are written down in a format similar to markdown, and markdown can be used in the labels:

{% multiple_choice name:"radiobutton" type:"radio" %}
# Which of these answers is the right answer?
this is line _two_ [click here](www.example.com) to see my site
[ ](answerA) A: This is **the correct** answer
[](answerB) B: A is the correct answer
[X](allAbove) C: All of the above
{% endmultiple_choice %}

_This question looks like this in markdown:_

{% raw %}
~~~markdown
{% multiple_choice name:"radiobutton" type:"radio" %}
# Which of these answers is the right answer?
this is line _two_ [click here to see my site](www.mysite.com)
[ ](answerA) A: This is **the correct** answer
[](answerB) B: A is the correct answer
[X](allAbove) C: All of the above
{% endmultiple_choice %}
~~~
{% endraw %}

## Image example
Using Markdown it's easy to embed an image in a survey. **Please look at this image closely** and answer the question below.

![Example from Unsplash](https://images.unsplash.com/photo-1548422392-679e1fc2eba4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1384&q=80)

{% multiple_choice name:"radiobutton" type:"checkbox" %}
# Which countries have you ever visited?
(multiple options are possible)
[ ](germany) Germany
[X](netherlands) Netherlands _or maybe just Amsterdam_
[ ](graceland) Graceland
{% endmultiple_choice %}

## Likert scales
A common question type is the Likert scale. This question-type is easy to create this as well:

{% likert name:"emotion" %}
# The capacity to experience emotions is important for intelligence
[ ](str_agree) strongly agree
[](agree) agree
[](neutral) neutral
[](disagree) disagree
[](str_disagree) strongly disagree
{% endlikert %}

## Free text
There are two types of free text possible, a text-area and a text-box.

Take a look at this javascript-code and give your feedback below.

```javascript
function hello(world) {
  alert("hello " + world)
}
```

{% text_input name:"clarification" type:"textarea" %}
# How would you improve the javascript above?
_you can write an example below_
[Thoughts and clarification](clarification)
{% endtext_input %}

## Combined questions
It's also possible to group inputs in one question-block (as long as they are the same type):

{% text_input name:"contact" %}
# What's your name?
[First and last name](name) Your full name _optional_

# What's your email-address?
[something@server.com](email) _optional_
{% endtext_input %}

_again, the markdown is easy to read:_

{% raw %}
```markdown
{% text_input name:"contact" %}
# What's your name?
[First and last name](name) Your full name _optional_

# What's your email-address?
[something@server.com](email) _optional_
{% endtext_input %}
```
{% endraw %}

## Storing answers
Answers can be stored in any backend of your choosing, by default Firebase. Answers are stored when participants click next page.

## Pairwise comparison
The next page demonstrates pair-wise comparison.
