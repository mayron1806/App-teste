#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Obtenha o caminho para o arquivo Info.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    // Obtenha o token do URL schema
    
    NSURL *url = launchOptions[UIApplicationLaunchOptionsURLKey];
    NSString *token = nil;
    if ([url.absoluteString  hasPrefix:@"org.reactjs.native.example.MyApp://token/"]) {
      token = [url.absoluteString  substringFromIndex:@"org.reactjs.native.example.MyApp://token/".length];
      NSLog(@"Token extraído: %@", token);
    }
    // Emita o evento para o JavaScript
    if (token) {
        [self.bridge.eventDispatcher sendAppEventWithName:@"onTokenReceived"
                                                     body:@{@"token": token}];
    }
    // Leitura do arquivo Info.plist
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    // Modificar o valor associado à chave "value"
    int value = 10; // Novo valor que você deseja definir
    [data setObject:[NSNumber numberWithInt:value] forKey:@"value"];
    
    // Escrever dados modificados de volta para o arquivo Info.plist
    [data writeToFile:path atomically:YES];
    
    // Não é necessário liberar a memória alocada pelo dicionário quando ARC está ativado.
    
    // Restante do código de inicialização
    return YES;
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Code a ser executado quando a aplicação está prestes a terminar

    // Crie o dicionário e adicione elementos
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    int value = 5;
    [data setObject:[NSNumber numberWithInt:value] forKey:@"numero"];
    [data writeToFile:path atomically:YES];
    
    // Não é necessário liberar a memória alocada pelo dicionário quando ARC está ativado.
}

// - (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
// {
// #if DEBUG
//   return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
// #else
//   return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
// #endif
// }

@end
