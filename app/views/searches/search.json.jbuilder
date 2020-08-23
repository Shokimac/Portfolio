json.array! @episodes do |episode|
    json.title episode.title
    json.body episode.body
end