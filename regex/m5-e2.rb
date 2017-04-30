class M5E2
     
    def cpf_validation(cpf)
        if cpf.match(/^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$/)
            return true
        end
        return false
    end
    
    def email_validation(email)
        if email.match(/^[A-Za-z\d\.\_]+@[A-Za-z\d\.]+$/)
            return true
        end
        return false
    end
    
    def price_validation(email)
        if email.match(/^R\$\s?\d{1,3}(\.\d{3})*,\d{2}$|^U\$\s?\d{1,3}(,\d{3})*\.\d{2}$/)
            return true
        end
        return false
    end
end