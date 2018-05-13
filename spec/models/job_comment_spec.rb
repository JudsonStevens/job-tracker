require 'rails_helper'

describe JobComment do
  describe 'validations' do
    describe 'invalid attributes' do
      it 'is invalid without content' do
        job_comment = JobComment.new()

        expect(job_comment).to be_invalid
      end
    end

    describe 'valid attributes' do
      it 'is valid with content' do
        job_comment = JobComment.new(content: 'Never thought you would say this')

        expect(job_comment).to be_valid
      end
    end
  end
end