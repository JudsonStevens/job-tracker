require 'rails_helper'

describe CompanyContact do
  describe 'Validations' do
    describe 'valid attributes' do
      it 'is valid if created with a name, position, and email' do
        company = Company.create!(name: 'ESPN')
        company_contact = company.company_contacts.new(name: 'Julie Andrews', position: 'Hiring Manager', email: 'Julie@hr.org')

        expect(company_contact).to be_valid
      end
    end

    describe 'invalid attributes' do
      it 'is invalid if created without a name' do
        company = Company.create!(name: 'ESPN')
        company_contact = company.company_contacts.new(position: 'Hiring Manager', email: 'Julie@hr.org')

        expect(company_contact).to be_invalid
      end

      it 'is invalid if created without a position' do
        company = Company.create!(name: 'ESPN')
        company_contact = company.company_contacts.new(name: 'Julie Andrews', email: 'Julie@hr.org')

        expect(company_contact).to be_invalid
      end

      it 'is invalid if created without an email' do
        company = Company.create!(name: 'ESPN')
        company_contact = company.company_contacts.new(name: 'Julie Andrews', position: 'Hiring Manager')

        expect(company_contact).to be_invalid
      end
    end
  end
end
