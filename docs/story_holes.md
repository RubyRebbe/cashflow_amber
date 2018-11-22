# Holes in Agile User Stories, and what to do about them

## Elevator Pitch:  Why you should care

Getting the right requirements is at least as important as
getting the requirements right.
This talk is a cautionary tale with three war stories
about holes in Agile user stories,
with some empirical advice drawn from the author's experience
about what to do about them.

## Getting the requirements right, and Getting the right requirements

Software developers are primarily concerned with

```
Getting the requirements right
```

That is, implementing the application correctly with respect to the requirements,
in Agile language a collection of user stories.

Which begs the 64 dollar question

```
Getting the right requirements 
```

Are we barking up the right tree, namely a tree with a cat in it?
For, if we are not, no amount of our effort will make the client happy.
I want to share a couple of war stories with you.

## AT&T Bell Labs, The C++ Department:  The missing List offset

When I was in the UNIX training Department at Bell Labs,
I taught UNIX internals and C,
and I was one of the first C++ instructors.
I was also interested in formal specification of abstract data types,
many of whose concepts have osmosed their way 
into object oriented requirements, design and programming,
concepts which are in active use today in automated testing methodologies and tools
(e.g. Ruby rspec, cucumber).

I closely tracked the evolution of what was then a rapidly changing language.
When the container class library (List, Stack, Queue, etc.)  was first released,
I decided to do an analysis a la formal specification of the List class.
Now this List class kept track of which element the user was interested in,
so presumably the UNIX manual page for the class should specify the state of the offset
with respect to every method, including the constructor.

Lo and behold,
when I analyzed list concatenation,
the manual page did not specify where the offset was in the resulting list.
Which meant that the implementation could put it anywhere, or assign it NULL.
This may all seem like a negligible trifle,
but by such faults are kingdoms lost.

I got myself invited to give a talk on this matter to the C++ Dept,
which the developers of the List class attended, among others.
They were belligerent, they were defensive, they disparaged formal specification
as useless to real programmers ... until 45 minutes into my talk
the chief designer of the component library *begrudgingly* admitted
that what I had discovered was a real problem, and needed to be fixed.
Bjarne Stroustrup, the inventor of C++, showed up way late in the talk.
I asked him:  "Bjarne, what brings you here?"
He replied:  "I heard that there was a great fight going on, and I just had to come!"

## The Chief Engineer

Here's another war story:

While working as an automated QA engineer at an outfit with a collection
of Ruby on Rails applications,
I was asked to pair program with Bala, a senior Rails developer,
to develop a fair-size reporting system both for internal use
as well as use by our customers, large municipal parking departments.
As it turned out, Bala and I both tested and programmed
in good TDD (Test-Driven Devlopment) style,
making heavy use of the Ruby automated test tool **rspec** .
The requirements for the reporting system had to do
with aggregating large amounts of small packets of data transmitted by tons of sensors.

The specs for the reporting system were admittedly finicky and mathematical,
and as in the previous war story,
I discovered a hole in the natural-language (English) requirements.
I asked various developers for help in filling this requirements hole,
they were not able to help,
so I wended my way up the food chain,
and found myself sitting in the office of the company's chief engineer.
I told him that Bala and I could neither test nor implement
until he filled in the hole in the spec.
Which he did.
Unlike in the previous story, the chief engineer was simply happy
that someone had uncovered a hole in the spec and wanted it fixed.
There are several morals to this story:

+ It takes courage to be a QA engineer!
+ QA engineers should own the requirements, not just product managers.
+ It is useful to have a pair of eyes separate from the developers
  to ensure the quality of the product.

## Cashflow application:  Tagging transactions

This war story is oriented to data modeling, what us old OOP folks call the object model.

Imagine your software team is responsible for building a 
full-stack web-based cashflow application, 
which enables the user to do what-if analysis of financial transactions,
where a transaction consists of 

+ a date
+ a description
+ a type:  income or expense
+ and a dollar amount

So the teams builds out the application.
The product manager then presents a new set of features  - 
having to do with tagged transactions -
to the team for 
design, implementation, test and deployment.

```
As a user of the cashflow app
I want to be able to manage (CRUD) tags
in order to categorize similar transactions 

As a user of the cashflow app
I want to be able to tag a transaction
in order to be able to filter and aggregate a collection of transactions
```

The product manager then goes on vacation for the entire two-week sprint,
expecting these stories to be tested and  implemented by the time s/he gets back,
fully confident that the requirements are clear and complete.

Back in the developer bullpen, the programmers scratch their heads over the relationship
between transactions and tags and decide -
just to be safe and as general as possible -
that it means

```
A Transaction can have zero or more Tags
A Tag can be associated with zero or more Transactions
```

After all, a Tag is not like an Account, right?
A Transaction must belong to **exactly** one Account, right?
But Tags are different, yeah?

When the product manager comes back from vacation nice and rested,
s/he discovers to his/her horror that the developers had completely misunderstood him/her.
What s/he really meant - s/he explains to the developers - was

```
A Transaction can have zero or one Tags
A Tag can be associated with zero or more Transactions
```

Product manager:  "I absolutely do not want multiple Tags associated with a Transaction.
That's gonna totally screw up aggregating over a tag!"

Some morals of this story:

+ Developers own the requirements, not just product managers and QA folk.
+ Don't make assumptions.  If it is the least bit unclear, check it out.

## Author Bio

email:  tsvi.bardavid@gmail.com
<br>
github:  https://github.com/rubyrebbe

Tsvi Bar-David is a senior SQA consultant who combines his expertise in the closely connected areas of
test automation and requirements for the benefit of his clients.
Tsvi has applied his skills and experience to the automated testing of both Ruby on Rails websites
as well as webstacks built on other kinds of servers.
He does feature, unit and API testing.
He believes that 

```
getting the right requirements
```

is a necessary pre-condition to

```
getting the requirements right
```

and seems to have a talent for ferreting out holes in the requirements.
He has also taught and mentored junior QA engineers in automated QA, TDD (Test Driven Development)
and BDD (Behavior Driven Development).

When he is not busy working,
Tsvi can be found doing sacred ecstatic drumming and chanting with other musicians and friends.
