# QuizBuilder App

## Requirements

Build a Quiz Builder App that:

* Allow someone (admin user) to create multiple Quiz
* For each quiz, the user should be able to create multiple questions (to keep things simple, for now, assume each question is a simple text field)
* Other Users (normal users), can then go to each Quiz, and answer all the questions.

> An extension for this task would be to add a type column in the question model (i.e. `text`, `radio`, `textarea`).

If you would like us to review your codebase (in whatever stage), please give me access to the github repository ([IsmailM]([url](https://github.com/IsmailM/)))

## Models
### User
- role: [:admin, :user]
- has_many :quizzes
- has_many :answers

### Quiz
- belongs_to :user
- has_many :questions
- has_many :answers

### Question
- belongs_to :quiz
- has_many :answers

### Answer
- belongs_to :quiz
- belongs_to :question
- belongs_to :user

## Test your models are working:
```ruby
u1 = User.create(name: 'Joe Bloggs', role: :admin)
u2 = User.create(name: 'Jane Doe', role: :user)

q = Quiz.create(name: 'Quiz 1', user_id: u1.id)
qu1 = Question.create(title: 'How tall are you?', quiz_id: q.id)
qu2 = Question.create(title: 'How much do you weigh?', quiz_id: q.id)

Answer.create(response: '180cm', question_id: qu1.id, user_id: u2.id, quiz_id: q.id)

# Other methods
u1.quizzes
u2.answers

q.questions.map do |question|
  [question.title, questions.answers.map(&:response).join(',')]
end
```


