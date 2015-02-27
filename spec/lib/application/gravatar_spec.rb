require 'rails_helper'

RSpec.describe Application::Gravatar, type: :module do
  include Application::Gravatar

  describe 'create_url' do
    it 'Should create a gravatar link' do
      subject = 'alankehoe111@gmail.com'
      result = create_url subject

      expect(result).to eq 'http://www.gravatar.com/avatar/cdf41ba70362ec8d20ef50d0a45a4217?d=identicon&s=200'
    end

    it 'Should allow to pass in optional arguments' do
      subject = 'alankehoe111@gmail.com'
      result = create_url subject, d: 'wavatar', s: 400

      expect(result).to eq 'http://www.gravatar.com/avatar/cdf41ba70362ec8d20ef50d0a45a4217?d=wavatar&s=400'
    end
  end
end
