[![Gem Version](https://badge.fury.io/rb/unicode-script.png)](http://badge.fury.io/rb/unicode-script)
unicode-script
==============

Small utility that allows you to detect scripts (languages) in unicode text.

###Usage: 
Suppose you have a string 

```ruby
h = 'ひらがな'
```

then you can detect the script to which this string belongs: 

```ruby
UnicodeScript.detect(h) # => [{:script => 'Hiragana', :value => 'ひらがな'}]
```

You can also check if string belongs to certain script:

```ruby
UnicodeScript.hiragana?(h) # => true
```
