//
//  SimpleParticleLayer.h
//  BasicCocos2D
//
//  Created by Ian Fan on 6/08/12.
//
//

#import "cocos2d.h"

@interface SimpleParticleLayer : CCLayer
{
  
}

@property (nonatomic,retain) CCParticleSystemQuad *particleSystemQuad;

+(CCScene *) scene;

@end
