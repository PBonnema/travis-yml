describe Travis::Yml::Schema::Def::Addon::CodeClimate do
  subject { Travis::Yml.schema[:definitions][:addon][:code_climate] }

  # it { puts JSON.pretty_generate(described_class.new.exports) }

  it do
    should include(
      '$id': :code_climate,
      title: 'Code Climate',
      summary: kind_of(String),
      see: kind_of(Hash),
      normal: true,
      anyOf: [
        {
          type: :object,
          properties: {
            repo_token: {
              '$ref': '#/definitions/type/secure',
              summary: 'Code Climate repo token'
            }
          },
          additionalProperties: false,
          prefix: {
            key: :repo_token
          },
          normal: true,
          changes: [
            {
              change: :enable
            }
          ],
        },
        {
          '$ref': '#/definitions/type/secure'
        },
        {
          type: :boolean
        }
      ]
    )
  end
end
