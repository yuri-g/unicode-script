# encoding: UTF-8
require 'spec_helper'

describe 'UnicodeScript' do
  it 'should be able to determine script of text' do
    h = 'ひらがな'
    k = 'カタカナ'
    mixed = '東京 Tokyo'
    expect(UnicodeScript.detect(h)).to eq([{ script:  'hiragana', value: 'ひらがな' }])
    expect(UnicodeScript.detect(k)).to eq([{ script:  'katakana', value:  'カタカナ' }])
    expect(UnicodeScript.detect(mixed)).to eq([{ script:  'cjk unified ideographs', value: '東京' },
                                           { script:  'basic latin', value: 'Tokyo' }])
  end

  it 'should be able to check whether string belongs to certain script' do
    h = '漢字'
    mixed = 'ひらaaaがな'
    expect(UnicodeScript.cjk_unified_ideographs?(h)).to eq(true)
    expect(UnicodeScript.hiragana?(mixed)).to eq(false)
  end
end
