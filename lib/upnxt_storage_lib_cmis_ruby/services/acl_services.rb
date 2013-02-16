module UpnxtStorageLibCmisRuby
  module Services
    class AclServices
      def initialize(service_url)
        @service = Internal::BrowserBindingService.new(service_url)
      end

      def get_acl(repository_id, object_id, only_basic_permissions, extension={})
        required = {cmisselector: 'acl',
                    repositoryId: repository_id,
                    objectId: object_id}
        optional = {onlyBasicPermissions: only_basic_permissions}
        @service.perform_request(required, optional)
      end

      def apply_acl(repository_id, object_id, add_aces, remove_aces, acl_propagation, extension={})
        required = {cmisaction: 'applyACL',
                    repositoryId: repository_id,
                    objectId: object_id}
        optional = {addACEs: add_aces,
                    removeACEs: remove_aces,
                    ACLPropagation: acl_propagation}
        @service.perform_request(required, optional)
      end
    end
  end
end
