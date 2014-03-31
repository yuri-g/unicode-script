# encoding: UTF-8
require 'spec_helper'

describe 'UnicodeScript' do
  it 'should be able to determine script of text' do
    h = 'ひらがな'
    k = 'カタカナ'
    mixed = "東京 Tokyo"
    UnicodeScript.detect(h).should eq([{:script => 'Hiragana', :value => 'ひらがな'}])
    UnicodeScript.detect(k).should eq([{:script => 'Katakana', :value => 'カタカナ'}])
    UnicodeScript.detect(mixed).should eq([{:script => 'CJK Unified Ideographs', :value => '東京'},
                                           {:script => 'Basic Latin', :value => 'Tokyo'}])
  end

  it 'should be able to check whether string belongs to certain script' do
    h = '漢字'
    mixed = 'ひらaaaがな'
    UnicodeScript.cjk_unified_ideographs?(h).should eq(true)
    UnicodeScript.hiragana?(mixed).should eq(false)
  end
end 
