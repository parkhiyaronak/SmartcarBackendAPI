module GmUtilities

  def get_information(request_type, extra_params =  nil)
    headers = { "Content-Type" => 'application/json' } #Seting headers
    body = { id: params[:id], responseType: "JSON" } #Setting request body
    body.merge!(extra_params) if extra_params.present? #If GM's API need extra parameters(like actionEngineService API needs command as an extra paramter) while making the requst

    #Using HTTPart for making request, ref: https://github.com/jnunemaker/httparty
    response = HTTParty.post(
      "http://gmapi.azurewebsites.net/#{request_type}",
      :body => body.to_json,
      :headers => headers
    )
    JSON.parse(response.body)
  end
end