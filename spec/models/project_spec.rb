require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:goal).of_type(:decimal).with_options(precison: 16, scale: 2) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:title) }
  end

  describe 'Features' do
    describe 'Attachments' do
      it 'has image as attachment' do
        expect(described_class.reflections.keys).to include('image_attachment', 'image_blob')
      end
    end

    describe 'Rich texts' do
      it 'has description as rich text' do
        expect(described_class.reflections.keys).to include('rich_text_description')
      end
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:goal) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_length_of(:title).is_at_most(80) }

    it { is_expected.to validate_numericality_of(:goal).is_less_than_or_equal_to(500).is_greater_than(0) }

    it 'doesn`t allow not image types as attachment for image' do
      file_path = Rails.root.join('spec', 'support', 'documents', 'test.txt')
      text_file = Rack::Test::UploadedFile.new(file_path, 'text/plain')
      subject.image = text_file
      subject.valid?

      expect(subject.errors[:image]).to include I18n.t('errors.messages.content_type_invalid')
    end

    it 'doesn`t allow images larger than 500kb' do
      file_path = Rails.root.join('spec', 'support', 'images', 'large-test.png')
      large_file = Rack::Test::UploadedFile.new(file_path, 'image/png')
      subject.image = large_file
      subject.valid?

      expect(subject.errors[:image]).to include I18n.t('errors.messages.file_is_too_large', size: 500, unit: 'kb')
    end

    it 'allow jpg, png and jpeg image types as attachment for image' do
      [
        { path: Rails.root.join('spec', 'support', 'images', 'test.jpg'), mime_type: 'image/jpg' },
        { path: Rails.root.join('spec', 'support', 'images', 'test.png'), mime_type: 'image/png' },
        { path: Rails.root.join('spec', 'support', 'images', 'test.jpg'), mime_type: 'image/jpeg' }
      ].each do |image_data|
        file = Rack::Test::UploadedFile.new(Rails.root.join(image_data[:path]), image_data[:mime_type])
        subject.image = file
        subject.valid?

        expect(subject.errors[:image]).to be_empty
      end
    end
  end
end
