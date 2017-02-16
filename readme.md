# Installation

`gem install webmock`

# How to

Run: `ruby main.rb`  
Test: `rake`

# Challenge

1. Complete the short version of the Big 5 test at http://www.personalitytest.net/ipip/index.html and save your results as text.

2. Create a new git repository for your code.

3. Write a BigFiveResultsTextSerializer that converts the textual results of your test into a hash. This class should have two methods - an initializer that takes a single text argument, and a hash function that takes no arguments. The result of the hash function must have the following format:

  ``` ruby
  {
    'NAME' => 'Your Name',
    'EXTRAVERSION' => {
      'Overall Score' => 92,
      'Facets' => {
        'Friendliness' => 90,
        'Gregariousness' => 98,
        'Assertiveness' => 60,
        'Activity Level' => 86,
        'Excitement-Seeking' => 73,
        'Cheerfulness' => 67
      }
    },
    'AGREEABLENESS' => {
      'Overall Score' => 82,
      'Facets' => {
        'Trust' => 75,
        'Morality' => 63,
        'Altruism' => 87,
        'Cooperation' => 64,
        'Modesty' => 80,
        'Sympathy' => 58
      }
    },
  ...
  }
  ```

4. Write a BigFiveResultsPoster class that submits your Big 5 results to our Recruitbot website. This class should have two methods - an initializer that takes a single results_hash argument, and a post function that posts a JSON representation of the result hash (as the request body). Keep in mind that this is a JSON endpoint so your request headers will need to specify JSON as the content type. This endpoint will either return a 202 and a receipt token in the body of the response, or a 422 with helpful error messages in the body of the response. The post function should return true if the post operation succeeded or false otherwise. Your BigFiveResultsPoster class should also have two readable attributes - response_code and token.

5. Using your BigFiveResultsTextSerializer and BigFiveResultsPoster classes, write a Ruby script that submits your results to Recruitbot.

6. Email us with your receipt token and a tarball of your git repository.
