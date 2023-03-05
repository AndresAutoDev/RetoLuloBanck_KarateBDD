package LuloBanck.Get;

import com.intuit.karate.junit5.Karate;

public class getRunner {

    @Karate.Test
    Karate userGet(){
        return  Karate.run().relativeTo(getClass());
    }
}
