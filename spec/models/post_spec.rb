require 'rails_helper'

describe Post do
  it 'post title' do
    post = build :post, title: 'rspec', body: '難しい'
    # post = Post.new(title: 'rspec', body: '難しい')
    expect(post.title).to eq 'rspec'
  end
  it 'body valid' do
    post = build :post, title: 'rspec', body: '難しい'
    expect(post).to be_valid
  end
end