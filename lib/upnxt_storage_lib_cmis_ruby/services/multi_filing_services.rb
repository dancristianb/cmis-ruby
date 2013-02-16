module UpnxtStorageLibCmisRuby
  module Services
    class MultiFilingServices
      def initialize(service_url)
        @service = Internal::BrowserBindingService.new(service_url)
      end

      def add_object_to_folder(repository_id, object_id, folder_id, all_versions, extension={})
        required = {cmisaction: 'addObjectToFolder',
                    repositoryId: repository_id,
                    objectId: object_id,
                    folderId: folder_id}
        optional = {allVersions: all_versions}
        @service.perform_request(required, optional)
      end

      def remove_object_from_folder(repository_id, object_id, folder_id, extension={})
        required = {repositoryId: repository_id,
                    cmisaction: 'removeObjectFromFolder',
                    objectId: object_id}
        optional = {folderId: folder_id}
        @service.perform_request(required, optional)
      end
    end
  end
end
