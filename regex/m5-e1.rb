class M5E1
    
    NOTICIAS = "09:55 - [política] Prefeito da Krakosia é eleito o melhor para economia\n"+
                "10:14 - [cotidiano] Cachorro salva dono de assalto\n"+
                "11:01 - [esporte] Seleção local de golfe se classifica para mundial\n"+
                "11:36 - [esporte] João da Silva Sauro é cortado da seleção de golfe\n"+
                "13:19 - [economia] Desemprego sobe para 12% no último mês\n"+
                "14:55 - [política] Lei de incentivo ao esporte é aprovada no senado às 10:20\n"+
                "16:13 - [economia] Cotação do dólar sobe 5% em uma semana\n"+
                "19:26 - [esporte] Liga nacional de basquete tem recorde de público"
    
    def format_news
        match_groups = NOTICIAS.scan(/(\d\d:\d\d)\s-\s\[(.*)\]\s(.*)/)
        hours = []
        themes = []
        news = []
        match_groups.each do |line|
            hours << line[0]
            themes << line[1]
            news << line[2]
        end
        news_formatted = ""
        match_groups.size.times do |n|
            news_formatted += "#{themes[n]}: #{news[n]} (#{hours[n]})"
            if n != match_groups.size-1
                news_formatted += "\n"
            end
        end
        return news_formatted
    end
    
    def find_economy_dollar_news
        match_groups = NOTICIAS.scan(/\[economia\].*dólar.*/)
        match_groups.size
    end
    
    def find_times
        match_groups = NOTICIAS.scan(/(\d{2}:\d{2}) -/)
        hours = []
        match_groups.each do |hour|
            hours << hour[0]
        end
        return hours
    end
    
end