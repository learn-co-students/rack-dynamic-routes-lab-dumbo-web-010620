class Application
    def call(env)
        resp = Rack::Response.new #sets new environments
        req = Rack::Request.new(env) #allows for extension paths? /___??

        if req.path.match(/items/)
            each_item = req.path.split("/items/").last
            if the_item = @@items.find { |item| item.name == each_item} #iterate through the list pulls the name IF its equivalent to the input
                resp.write the_item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end

            # resp.write "#{each_item}"
            # each_item = req.params["items"]
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end