---
layout: questions
title: "Some last questions..."
button: submit
pageNo: 2
---
Here are some example questions, have fun answering them!

{% multiple_choice name:"radiobutton" type:"radio" %}
# Which of these answers is the right answer?
this is line _two_ [click here to see my site](www.mysite.com)
[ ](answerA) A: This is the correct answer
[](answerB) B: A is the correct answer
[X](allAbove) C: All of the above
{% endmultiple_choice %}

If you like, you can put in some extra Markdown content in between.

## Even a heading is possible
And images, etc.

{% multiple_choice name:"radiobutton" type:"checkbox" %}
# Which countries have you ever visited?
(multiple options are possible)
[ ](germany) Germany
[X](netherlands) Netherlands _or maybe just Amsterdam_
[ ](graceland) Graceland
{% endmultiple_choice %}

{% likert name:"emotion" type:"checkbox" %}
# The capacity to experience emotions is important for intelligence
[ ](str_agree) strongly agree
[](agree) agree
[](neutral) neutral
[](disagree) disagree
[](str_disagree) strongly disagree
{% endlikert %}
