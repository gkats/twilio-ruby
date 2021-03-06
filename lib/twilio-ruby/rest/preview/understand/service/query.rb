##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryList < ListResource
            ##
            # Initialize the QueryList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [QueryList] QueryList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Queries"
            end

            ##
            # Lists QueryInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] language The language
            # @param [String] model_build The model_build
            # @param [String] status The status
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(language: :unset, model_build: :unset, status: :unset, limit: nil, page_size: nil)
              self.stream(
                  language: language,
                  model_build: model_build,
                  status: status,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams QueryInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] language The language
            # @param [String] model_build The model_build
            # @param [String] status The status
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(language: :unset, model_build: :unset, status: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  language: language,
                  model_build: model_build,
                  status: status,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields QueryInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size])

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] language The language
            # @param [String] model_build The model_build
            # @param [String] status The status
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of QueryInstance
            def page(language: :unset, model_build: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Language' => language,
                  'ModelBuild' => model_build,
                  'Status' => status,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              QueryPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of QueryInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              QueryPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of QueryInstance records from the API.
            # Request is executed immediately.
            # @param [String] language The language
            # @param [String] query The query
            # @param [String] intent The intent
            # @param [String] model_build The model_build
            # @param [String] field The field
            # @param [String] named_entity The named_entity
            # @return [QueryInstance] Newly created QueryInstance
            def create(language: nil, query: nil, intent: :unset, model_build: :unset, field: :unset, named_entity: :unset)
              data = Twilio::Values.of({
                  'Language' => language,
                  'Query' => query,
                  'Intent' => intent,
                  'ModelBuild' => model_build,
                  'Field' => field,
                  'NamedEntity' => named_entity,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              QueryInstance.new(@version, payload, service_sid: @solution[:service_sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.QueryList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryPage < Page
            ##
            # Initialize the QueryPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [QueryPage] QueryPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of QueryInstance
            # @param [Hash] payload Payload response from the API
            # @return [QueryInstance] QueryInstance
            def get_instance(payload)
              QueryInstance.new(@version, payload, service_sid: @solution[:service_sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.QueryPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryContext < InstanceContext
            ##
            # Initialize the QueryContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [QueryContext] QueryContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid}
              @uri = "/Services/#{@solution[:service_sid]}/Queries/#{@solution[:sid]}"
            end

            ##
            # Fetch a QueryInstance
            # @return [QueryInstance] Fetched QueryInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              QueryInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid])
            end

            ##
            # Update the QueryInstance
            # @param [String] sample_sid The sample_sid
            # @param [String] status The status
            # @return [QueryInstance] Updated QueryInstance
            def update(sample_sid: :unset, status: :unset)
              data = Twilio::Values.of({'SampleSid' => sample_sid, 'Status' => status})

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              QueryInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid])
            end

            ##
            # Deletes the QueryInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.QueryContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class QueryInstance < InstanceResource
            ##
            # Initialize the QueryInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [QueryInstance] QueryInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'results' => payload['results'],
                  'language' => payload['language'],
                  'model_build_sid' => payload['model_build_sid'],
                  'query' => payload['query'],
                  'sample_sid' => payload['sample_sid'],
                  'service_sid' => payload['service_sid'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid']}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [QueryContext] QueryContext for this QueryInstance
            def context
              unless @instance_context
                @instance_context = QueryContext.new(@version, @params['service_sid'], @params['sid'])
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Hash] The results
            def results
              @properties['results']
            end

            ##
            # @return [String] The language
            def language
              @properties['language']
            end

            ##
            # @return [String] The model_build_sid
            def model_build_sid
              @properties['model_build_sid']
            end

            ##
            # @return [String] The query
            def query
              @properties['query']
            end

            ##
            # @return [String] The sample_sid
            def sample_sid
              @properties['sample_sid']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The status
            def status
              @properties['status']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # Fetch a QueryInstance
            # @return [QueryInstance] Fetched QueryInstance
            def fetch
              context.fetch
            end

            ##
            # Update the QueryInstance
            # @param [String] sample_sid The sample_sid
            # @param [String] status The status
            # @return [QueryInstance] Updated QueryInstance
            def update(sample_sid: :unset, status: :unset)
              context.update(sample_sid: sample_sid, status: status)
            end

            ##
            # Deletes the QueryInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.QueryInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.QueryInstance #{values}>"
            end
          end
        end
      end
    end
  end
end