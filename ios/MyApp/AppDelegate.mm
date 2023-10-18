#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Obtenha o caminho para o arquivo Info.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    
    // Leitura do arquivo Info.plist
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    // Modificar o valor associado à chave "value"
    int value = 10; // Novo valor que você deseja definir
    [data setObject:[NSNumber numberWithInt:value] forKey:@"value"];
    
    // Escrever dados modificados de volta para o arquivo Info.plist
    [data writeToFile:path atomically:YES];
    
    // Libere a memória alocada pelo dicionário
    [data release]; // Note: Somente se você não estiver usando ARC
    
    // Restante do código de inicialização
    return YES;
}
- (void)applicationWillTerminate:(UIApplication *)application {
  // Code a ser executado quando a aplicação está prestes a terminar

  // Crie o dicionário e adicione elementos
  NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:self.path];
  int value = 5;
  [data setObject:[NSNumber numberWithInt:value] forKey:@"numero"];
  [data writeToFile:self.path atomically:YES];

}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
