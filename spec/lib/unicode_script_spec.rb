# encoding: UTF-8
require 'spec_helper'

describe 'UnicodeScript' do
  it 'should be able to determine script of text' do
    h = 'ひらがな'
    k = 'カタカナ'
    mixed = "東京 Tokyo"
    UnicodeScript.detect(h).should eq([{:script => 'hiragana', :value => 'ひらがな'}])
    UnicodeScript.detect(k).should eq([{:script => 'katakana', :value => 'カタカナ'}])
    UnicodeScript.detect(mixed).should eq([{:script => 'cjk unified ideographs', :value => '東京'},
                                           {:script => 'basic latin', :value => 'Tokyo'}])
  end

  it 'should be able to check whether string belongs to certain script' do
    h = '漢字'
    mixed = 'ひらaaaがな'
    UnicodeScript.cjk_unified_ideographs?(h).should eq(true)
    UnicodeScript.hiragana?(mixed).should eq(false)
  end
end 
