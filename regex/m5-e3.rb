class M5E3
    
    def initialize
            @not_ok = 0
            @max_accesses = ""
            @file = ""
            @error = ""
    end
        
    def log_analysis
        file = File.open("log-do-servidor.log", "r")
        
        accesses = {}
        file.each_line do |line|
            
            #IPs com mais requisições
            ip = line.scan(/^.*\s-\s(.*):/)[0][0]
            if accesses[ip] != nil
                accesses[ip] = accesses[ip]+1
            else
                accesses[ip] = 1
            end
            max = 0
            accesses.keys.each do |ips|
                if accesses[ips] > max
                    max = accesses[ips]
                    @max_accesses = accesses.key(max)
                end
            end
            
            #Quantidade de ERROs e ALERTAs
            status = line.scan(/:\s(\w+)/)[0][0]
            if status == "ALERTA" || status == "ERRO"
                @not_ok += 1
            end
            
            #Busca por arquivo de 21/07/2016 às 00:17:50
            file_name = line.scan(/^2016-07-21 00:17:50 - .* \| (\w+\/)+(\w+\.\w{3})/)
            if file_name[0] != nil
                @file = file_name[0][1]
            end
            
            #Busca por erro acesso em 31/07/2016 às 06:11:20
            error_name = line.scan(/^2016-07-31 06:11:20 - .*\| [\w\/\.]+ \((.+)\)$/)
            if error_name[0] != nil
                @error = error_name[0][0]
            end
        end
        
        file.close
    end
    
    def put_results
        out = File.open("m5-e3.txt", "w")
        out.puts("#{@max_accesses}")
        out.puts("#{@not_ok}")
        out.puts("#{@file}")
        out.puts("#{@error}")
        out.close
    end
    
end