require 'bcrypt'
require "date"

class PublicController < ApplicationController
  def home
    @mission_statement = retrieve_public_text_body("Mission Statement")
    @next_episode_name = retrieve_public_text_body("Next Episode:name")
    next_episode_date_raw = retrieve_public_text_body("Next Episode:date")
    @next_episode_date = next_episode_date_to_display_s( Date.parse(
                            next_episode_date_raw
                          )) if next_episode_date_raw
    @episodes = Episode.order(:episode_number).reverse.select{ |episode| episode.episode_number}
  end

  private

  def next_episode_date_to_display_s(date_object)
    moji = case date_object.wday
              when 1 then "月"
              when 2 then "火"
              when 3 then "水"
              when 4 then "木"
              when 5 then "金"
              when 6 then "土"
              when 7 then "日"
            end
    month = Date::MONTHNAMES[date_object.month][0..2].upcase
    return "#{month} #{date_object.day} 「#{moji}」"
  end

  def retrieve_public_text_body(public_text_name)
    @search_query = PublicText.where(public_text_name: public_text_name)[0]
    return @search_query ? @search_query.body : nil
  end

end
