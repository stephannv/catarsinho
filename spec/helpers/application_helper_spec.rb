require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'errors_for' do
    context 'when there is error on given attribute' do
      let(:resource) { double(errors: { foo: ['bar'] }) }

      it 'returns html element with error message' do
        expected_result = helper.content_tag(:p, 'bar', class: 'help is-danger')
        expect(helper.errors_for(resource, :foo)).to eq expected_result
      end
    end

    context 'when there isn`t error on given attribute' do
      let(:resource) { double(errors: { foo: [] }) }

      it 'returns nil' do
        expect(helper.errors_for(resource, :foo)).to be_nil
      end
    end
  end

  describe 'input_class_for' do
    context 'when there is error on given attribute' do
      let(:resource) { double(errors: { foo: ['bar'] }) }

      it 'returns `input is-danger` classes' do
        expect(helper.input_class_for(resource, :foo)).to eq 'input is-danger'
      end
    end

    context 'when there isn`t error on given attribute' do
      let(:resource) { double(errors: { foo: [] }) }

      it 'returns `input` class' do
        expect(helper.input_class_for(resource, :foo)).to eq 'input'
      end
    end
  end

  describe '#error_for?' do
    context 'when resource isn`t present' do
      it 'returns nil' do
        expect(helper.error_for?(nil, :foo)).to be_nil
      end
    end

    context 'when resource is present' do
      context 'when there is error on given attribute' do
        let(:resource) { double(errors: { foo: ['bar'] }) }

        it 'returns true' do
          expect(helper.error_for?(resource, :foo)).to be_truthy
        end
      end

      context 'when there isn`t error on given attribute' do
        let(:resource) { double(errors: { foo: [] }) }

        it 'returns false' do
          expect(helper.error_for?(resource, :foo)).to be_falsey
        end
      end
    end
  end
end
