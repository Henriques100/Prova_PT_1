package principal.secundario;

import com.intuit.karate.junit5.Karate;

class Goresteres {
    
    @Karate.Test
    Karate Testes() {
        return Karate.run("teste site gorest").relativeTo(getClass());
    }    

}