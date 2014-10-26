module Github
  class Payload

    def initilize(raw_payload)
      @raw_payload = raw_payload
    end

    def data
      # TODO: error handling on not JSON or not HASH
      @data ||= Hashie::Mash.new(JSON.parse(@raw_payload))
    end
  end
end
