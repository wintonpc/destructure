require 'destruct'

class Destruct
  describe Compiler do
    it 'compiles literals' do
      cp = Compiler.compile(1)
      expect(cp.match(1)).to be_a Env
      expect(cp.match(2)).to be_nil

      cp = Compiler.compile("foo")
      expect(cp.match("foo")).to be_a Env
      expect(cp.match("bar")).to be_nil
    end
    it 'compiles vars' do
      cp = Compiler.compile(Var.new(:foo))
      e = cp.match(1)
      expect(e).to be_an Env
      expect(e[:foo]).to eql 1
    end
  end
end