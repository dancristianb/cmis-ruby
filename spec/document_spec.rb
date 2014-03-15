require_relative './helper'

describe CMIS::Document do

  before :all do
    @repo = create_repository('test')
  end

  after :all do
    delete_repository('test')
  end

  it 'create_in_folder with content' do
    new_object = @repo.new_document
    new_object.name = 'doc1'
    new_object.object_type_id = 'cmis:document'
    new_object.content = { stream: StringIO.new('content1'),
                           mime_type: 'text/plain',
                           filename: 'doc1.txt' }
    doc = new_object.create_in_folder(@repo.root)
    doc.name.should eq 'doc1'
    doc.content_stream_mime_type.should eq 'text/plain'
    doc.content_stream_file_name.should eq 'doc1.txt'
    doc.content.should eq 'content1'
    doc.delete
  end

  it 'create_in_folder without content' do
    new_object = @repo.new_document
    new_object.name = 'doc2'
    new_object.object_type_id = 'cmis:document'
    doc = new_object.create_in_folder(@repo.root)
    doc.name.should eq 'doc2'
    doc.content.should be nil
    doc.delete
  end

  # it 'set content - attached' do
  #   new_object = @repo.new_document
  #   new_object.name = 'doc3'
  #   new_object.object_type_id = 'cmis:document'
  #   doc = @repo.root.create(new_object)
  # doc.content =  { stream: StringIO.new('content3'),
  #                  mime_type: 'text/plain',
  #                  filename: 'doc3.txt' }
  #   doc.content.should eq 'content3'
  #   doc.delete
  # end
end
