# 🛩Joe's Discount Aeroplane Travel
## _You Get What You Pay For©_

The goal of this app was to become more familiar with the [Spreedly API](https://docs.spreedly.com) and get a better feeling of what our customers go through.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [To Run Locally](#to-run-locally)
- [Disclaimer](#disclaimer)
- [Feedback on the exercise and docs](#feedback-on-the-exercise-and-docs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## To Run Locally

Once you've installed the correct Ruby version and the `bundler` gem, you're all set to install the rest of the gems!

```
bundle
```

Next, create your database, and seed in some test flights.
```
rails db:seed
```

You should be all set now to run your Rails server with `rails s` and to start booking some flights at [http://localhost:3000](http://localhost:3000)!

[Here are some credit card numbers](https://docs.spreedly.com/reference/test-data/) you can test with.

## Disclaimer
* There's _lots_ of room for improvement in the code! The focus of this exercise was to go through the Spreedly docs and get payments set up and working. If this was going to production, I'd take more time to:
  * organize the code
  * add tests
  * prevent user from being able to change "amount" value
  * improve the UI
  * and more!

## Feedback on the exercise and docs
I have a lil' list of feedback available upon request :)
