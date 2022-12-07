package fhv.ws22.se.skyward;

import com.google.inject.AbstractModule;
import fhv.ws22.se.skyward.domain.SessionProvider;
import fhv.ws22.se.skyward.domain.SessionService;

public class AppConfig extends AbstractModule {
    @Override
    protected void configure() {
        bind(SessionService.class).toProvider(SessionProvider.class);
    }
}
