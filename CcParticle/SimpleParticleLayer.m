//
//  SimpleParticleLayer.m
//  BasicCocos2D
//
//  Created by Ian Fan on 6/08/12.
//
//

#import "SimpleParticleLayer.h"

@implementation SimpleParticleLayer

@synthesize particleSystemQuad;

+(CCScene *) scene {
	CCScene *scene = [CCScene node];
	SimpleParticleLayer *layer = [SimpleParticleLayer node];
	[scene addChild: layer];
  
	return scene;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  CGPoint point = [touch locationInView:[touch view]];
  point = [[CCDirector sharedDirector]convertToGL:point];
  
  if (self.particleSystemQuad != nil) {
    self.particleSystemQuad.life = 1;
    self.particleSystemQuad = nil;
  }
  self.particleSystemQuad = [CCParticleSystemQuad particleWithFile:@"magicFire.plist"];
  [self addChild:self.particleSystemQuad];
  particleSystemQuad.duration = -1;
  
  particleSystemQuad.position = point;
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  CGPoint point = [touch locationInView:[touch view]];
  point = [[CCDirector sharedDirector]convertToGL:point];
  
  particleSystemQuad.position = point;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  CGPoint point = [touch locationInView:[touch view]];
  point = [[CCDirector sharedDirector]convertToGL:point];
  
  particleSystemQuad.position = point;
  particleSystemQuad.duration = 1;
  self.particleSystemQuad = nil;
}

#pragma mark - Setup

-(void)setParticle {
  [[CCTextureCache sharedTextureCache] addImage:@"magicFireParticalTexture.png"];
  
  self.particleSystemQuad = [CCParticleSystemQuad particleWithFile:@"magicFire.plist"];
  particleSystemQuad.duration = 2;
  particleSystemQuad.position = ccp([CCDirector sharedDirector].winSize.width/2, [CCDirector sharedDirector].winSize.height/2);
  [self addChild:self.particleSystemQuad];
}

#pragma mark - Init

-(id) init {
	if((self = [super init])) {
    [self setParticle];
    
    [CCDirector sharedDirector].view.multipleTouchEnabled = NO;
    self.touchEnabled = YES;
	}
	return self;
}

- (void) dealloc {
  self.particleSystemQuad = nil;
  
  [[CCDirector sharedDirector].view setMultipleTouchEnabled:YES];
	[super dealloc];
}

@end
