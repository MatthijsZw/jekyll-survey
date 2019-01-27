# jekyll-survey

A way to create simple surveys using Jekyll. You can create single-page or multi-page questionnaires. Answers are stored in Firebase (or a back-end of your choosing). [Example survey](https://matth-ijs.nl/files/jekyll_survey/index.html)

**Please note:** I consider this code to be a 'working prototype'. It does not follow best-practice and is not production-ready.

## Why:
Create fully customizable surveys. Everything is under your control: styling, question-types, etc.

## Set-up:
1. Pull the code
2. update the `firebase.yml` with your account details

### Optional steps:
1. update your private `.git/info/exclude/` and add a line about `firebase.yml` if you want don't want to push your credentials to a (public) repository
2. enable google-analytics by setting the `ga`-code to your `UA`-number in the _config.yml

## Usage:
Create one or multiple pages in the `_pages`-folder with markdown, see the examples in the `_pages`-folder. Then add your questions.

### Question-types
Currently, the survey supports text-input, multiple-choice, [likert-scales](https://en.m.wikipedia.org/wiki/Likert_scale) and [pairwise-comparison](https://en.m.wikipedia.org/wiki/Pairwise_comparison).

This works with question-blocks, so questions are integrated with the markdown. **Every question-block needs a unique identifier with the `name`-variable** (see the examples below). Most question-blocks accept other variables as well.

You can use markdown in the question-block as well, as shown in the examples.

#### Text-input
There are two types of text-input: a single-line (`text` in html) or a multi-line (`textarea`). You can add multiple text-inputs of the same type in one `question`-block. Please note that any line starting with a bracket (`[`) will be treated as a question!

The markdown for a textinput is as follows: `[hint-text](form-element-name) Text on the label`.

```
{% text_input name:"clarification" type:"textarea" %}
# Space for clarification
_is there any answer you want to clarify?_
[Thoughts and clarification](clarification)
{% endtext_input %}
```

```
{% text_input name:"contact" %}
# What's your name?
[First and last name](name) Your full name _optional_

# What's your email-address?
[something@server.com](email) _optional_
{% endtext_input %}
```

#### Multiple choice
Two ways of multiple choice are implemented: checkbox and radiobutton. Markup is the same for both types, so you can easily switch by changing the `type` variable.

Every line starting with a bracket (`[`) is treated as an input. The markup is as follows: `[](name) label`. You can use markdown for the label and the `[]` can contain a space (for readability) or an `X` to preselect the checkbox/radiobutton.

Please note that radiobuttons in a question-block are automatically grouped!

```
{% multiple_choice name:"radiobutton" type:"radio" %}
# Which of these answers is the right answer?
this is line _two_ [click here to see my site](www.mysite.com)
[ ](answerA) A: This is the correct answer
[](answerB) B: A is the correct answer
[X](allAbove) C: All of the above
{% endmultiple_choice %}
```

```
{% multiple_choice name:"radiobutton" type:"checkbox" %}
# Which countries have you ever visited?
(multiple options are possible)
[ ](germany) Germany
[X](netherlands) Netherlands _or maybe just Amsterdam_
[ ](graceland) Graceland
{% endmultiple_choice %}
```

#### Likert-scales
Likert-scales work the same as radiobuttons, but are visualized differently: the likert-scale is horizontal. It's possible to use any amount of options (5, 7 and 9 are typically used).

```
{% likert name:"emotion" type:"checkbox" %}
# The capacity to experience emotions is important for intelligence
[ ](str_agree) strongly agree
[](agree) agree
[](neutral) neutral
[](disagree) disagree
[](str_disagree) strongly disagree
{% endlikert %}
```

### Pairwise_comparison
This works differently from other question-types. Pairwise_comparison is a way to rank a list of options by providing binary choices between every combination.

Create a new page and add the options you want to use in the `YAML`. It's possible to add a focus point for images using percentages (`x y`).

```
questions:
  - title: Option 1
    image: "https://www.example.com/image1.jpg"
    img_pos: "40% 80%"
  - title: Option 2
    image: "/images/image2.jpg"
    img_pos: "20% 20%"
  - title: Option 3
    image: "/images/image3.jpg"
    img_pos: "center"
```
