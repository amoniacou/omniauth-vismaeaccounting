# frozen_string_literal: true

# NOTE: it would be useful if this lived in omniauth-oauth2 eventually
# Thanks to Josh Ellithorpe for this file -Will

shared_examples 'an oauth2 strategy' do
  describe '#client' do
    let(:options) do
      { client_options: { 'authorize_url' => 'https://example.com' } }
    end

    it 'is initialized with symbolized client_options' do
      expect(client.options[:authorize_url]).to eq('https://example.com')
    end
  end

  describe '#authorize_params' do
    let(:options) do
      { authorize_params: { foo: 'bar', baz: 'zip' } }
    end

    it 'includes any authorize params passed in the :authorize_params option' do
      expect(subject.authorize_params['foo']).to eq('bar')
      expect(subject.authorize_params['baz']).to eq('zip')
    end
  end

  describe '#authorize_options' do
    let(:options) do
      { authorize_options: %i[scope foo], scope: 'bar', foo: 'baz' }
    end

    it 'includes top-level options that are marked as :authorize_options' do
      expect(subject.authorize_params['scope']).to eq('bar')
      expect(subject.authorize_params['foo']).to eq('baz')
    end
  end

  describe '#token_params' do
    let(:options) do
      { token_params: { foo: 'bar', baz: 'zip' } }
    end

    it 'includes any token params passed in the :token_params option' do
      expect(subject.token_params['foo']).to eq('bar')
      expect(subject.token_params['baz']).to eq('zip')
    end
  end

  describe '#token_options' do
    let(:options) do
      { token_options: %i[scope foo], scope: 'bar', foo: 'baz' }
    end

    it 'includes top-level options that are marked as :token_options' do
      expect(subject.token_params['scope']).to eq('bar')
      expect(subject.token_params['foo']).to eq('baz')
    end
  end
end
