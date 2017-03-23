require_relative '../caesar_cipher'

describe CaesarCipher do

  it 'encrypts strings' do
    expect(CaesarCipher.encrypt("What a string!", 5)).to eq("Bmfy f xywnsl!")
  end

  it "wraps from 'z' to 'a'" do
    expect(CaesarCipher.encrypt("Zerg", 5)).not_to eq("_jwl")    
    expect(CaesarCipher.encrypt("Johnny", 3)).to eq("Mrkqqb")
  end

end
