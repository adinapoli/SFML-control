{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

module Control.Monad.SFML.Conversions where


import Control.Monad.SFML.Types.TH
import qualified SFML.Graphics as G
import qualified SFML.Audio as A
import qualified SFML.System as S
import qualified SFML.Window as W
import Data.Maybe

-- | Run the given IO action and throw an error if it fails.
-- This function is the dual of SFML's 'err'. The idea here
-- is that we accept a certain level of pragmatism and assume
-- the underlying C library is unlikely to fail for out-of-memory
-- errors or data corruption. 'SFML' follows a more disciplined
-- approach.
mb :: IO (Maybe a) -> IO a
mb = (maybe (error "Nothing found.") return =<<)


-- * Audio / Listener.hs
$(lift 'A.setGlobalVolume)
$(lift 'A.getGlobalVolume)
$(lift 'A.setListenerPosition)
$(lift 'A.getListenerPosition)
$(lift 'A.setListenerDirection)
$(lift 'A.getListenerDirection)

-- * Audio / Music.hs
$(liftWithDestroy 'G.err 'A.musicFromFile)
$(liftWithDestroy 'G.err 'A.musicFromMemory)
$(liftWithDestroy 'G.err 'A.musicFromStream)
$(lift 'A.setLoop)
$(lift 'A.getLoop)
$(lift 'A.getDuration)
$(lift 'A.play)
$(lift 'A.pause)
$(lift 'A.stop)
$(lift 'A.getChannelCount)
$(lift 'A.getSampleRate)
$(lift 'A.getStatus)
$(lift 'A.getPlayingOffset)
$(lift 'A.setPitch)
$(lift 'A.setVolume)
$(lift 'A.setPosition)
$(lift 'A.setRelativeToListener)
$(lift 'A.setMinDistance)
$(lift 'A.setAttenuation)
$(lift 'A.setPlayingOffset)
$(lift 'A.getPitch)
$(lift 'A.getVolume)
$(lift 'A.getPosition)
$(lift 'A.isRelativeToListener)
$(lift 'A.getMinDistance)
$(lift 'A.getAttenuation)

-- * Audio / Sound.hs
$(liftWithDestroy 'id 'A.createSound)
$(lift 'A.copySound)
$(lift 'A.setSoundBuffer)
$(lift 'A.getSoundBuffer)

-- * Audio / SoundBuffer.hs
$(liftWithDestroy 'G.err 'A.soundBufferFromFile)
$(liftWithDestroy 'G.err 'A.soundBufferFromMemory)
$(liftWithDestroy 'G.err 'A.soundBufferFromStream)
$(liftWithDestroy 'mb 'A.soundBufferFromSamples)
$(lift 'A.copySoundBuffer)
$(lift 'A.saveSoundBufferToFile)
$(lift 'A.getSamples)
$(lift 'A.getSampleCount)

-- * Audio / SoundBufferRecorder.hs
$(liftWithDestroy 'G.err 'A.createSoundBufferRecorder)
$(lift 'A.startRecording)
$(lift 'A.stopRecording)

-- * Audio / SoundRecorder.hs
$(liftWithDestroy 'G.err 'A.createSoundRecorder)
$(lift 'A.isSoundRecorderAvailable)

-- * Audio / SoundStream.hs
$(liftWithDestroy 'id 'A.createSoundStream)

-- * Graphics / CircleShape.hs
$(liftWithDestroy 'G.err 'G.createCircleShape)
$(lift 'G.copy)
$(lift 'G.setRotation)
$(lift 'G.setScale)
$(lift 'G.setOrigin)
$(lift 'G.getRotation)
$(lift 'G.getScale)
$(lift 'G.getOrigin)
$(lift 'G.move)
$(lift 'G.rotate)
$(lift 'G.scale)
$(lift 'G.getTransform)
$(lift 'G.getInverseTransform)
$(lift 'G.setTexture)
$(lift 'G.setTextureRect)
$(lift 'G.getTexture)
$(lift 'G.getTextureRect)
$(lift 'G.setFillColor)
$(lift 'G.setOutlineColor)
$(lift 'G.setOutlineThickness)
$(lift 'G.getFillColor)
$(lift 'G.getOutlineColor)
$(lift 'G.getOutlineThickness)
$(lift 'G.getPointCount)
$(lift 'G.getPoint)
$(lift 'G.setRadius)
$(lift 'G.getRadius)
$(lift 'G.setPointCount)
$(lift 'G.getLocalBounds)
$(lift 'G.getGlobalBounds)

-- * Graphics / ConvexShape.hs
$(liftWithDestroy 'G.err 'G.createConvexShape)
$(lift 'G.setPoint)

-- * Graphics / Font.hs
$(liftWithDestroy 'G.err 'G.fontFromFile)
$(liftWithDestroy 'G.err 'G.fontFromMemory)
$(liftWithDestroy 'G.err 'G.fontFromStream)
$(lift 'G.getGlyph)
$(lift 'G.getKerning)
$(lift 'G.getLineSpacing)
$(lift 'G.getFontTexture)

-- * Graphics / Image.hs
$(liftWithDestroy 'G.err 'G.createImage)
$(liftWithDestroy 'id 'G.imageFromColor)
$(liftWithDestroy 'id 'G.imageFromPixels)
$(liftWithDestroy 'mb 'G.imageFromFile)
$(liftWithDestroy 'mb 'G.imageFromMemory)
$(liftWithDestroy 'mb 'G.imageFromStream)
$(lift 'G.destroy)
$(lift 'G.saveImage)
$(lift 'G.imageSize)
$(lift 'G.createMaskFromColor)
$(lift 'G.copyImage')
$(lift 'G.setPixel)
$(lift 'G.getPixel)
$(lift 'G.getPixels)
$(lift 'G.flipHorizontally)
$(lift 'G.flipVertically)

-- * Graphics / RectangleShape.hs
$(liftWithDestroy 'G.err 'G.createRectangleShape)
$(lift 'G.setSize)
$(lift 'G.getSize)

-- * Graphics / RenderTexture.hs
$(liftWithDestroy 'G.err 'G.createRenderTexture)
$(lift 'G.getTextureSize)
$(lift 'G.setActive)
$(lift 'G.clear)
$(lift 'G.setView)
$(lift 'G.getView)
$(lift 'G.getDefaultView)
$(lift 'G.getViewport)
$(lift 'G.mapPixelToCoords)
$(lift 'G.drawSprite)
$(lift 'G.drawText)
$(lift 'G.drawShape)
$(lift 'G.drawCircle)
$(lift 'G.drawConvexShape)
$(lift 'G.drawRectangle)
$(lift 'G.drawVertexArray)
$(lift 'G.drawPrimitives)
$(lift 'G.drawPrimitives')
$(lift 'G.pushGLStates)
$(lift 'G.popGLStates)
$(lift 'G.resetGLStates)
$(lift 'G.getRenderTexture)
$(lift 'G.setSmooth)
$(lift 'G.isSmooth)

-- * Graphics / RenderWindow.hs
$(liftWithDestroy 'id 'G.createRenderWindow)
$(liftWithDestroy 'id 'G.renderWindowFromHandle)
$(lift 'G.close)
$(lift 'G.isWindowOpen)
$(lift 'G.getWindowSettings)
$(lift 'G.pollEvent)
$(lift 'G.waitEvent)
$(lift 'G.getWindowPosition)
$(lift 'G.setWindowPosition)
$(lift 'G.getWindowSize)
$(lift 'G.setWindowSize)
$(lift 'G.setWindowTitle)
$(lift' 'G.setWindowIcon 4)
$(lift 'G.setWindowVisible)
$(lift 'G.setMouseVisible)
$(lift 'G.setVSync)
$(lift 'G.setKeyRepeat)
$(lift 'G.setWindowActive)
$(lift 'G.display)
$(lift 'G.setFramerateLimit)
$(lift 'G.setJoystickThreshold)
$(lift 'G.getSystemHandle)
$(lift 'G.clearRenderWindow)
$(lift 'G.captureRenderWindow)
$(lift 'G.getMousePosition)
$(lift 'G.setMousePosition)

-- * Graphics / Shader.hs
$(liftWithDestroy 'G.err 'G.shaderFromFile)
$(liftWithDestroy 'G.err 'G.shaderFromMemory)
$(liftWithDestroy 'G.err 'G.shaderFromStream)
$(lift 'G.setFloatParameter)
$(lift 'G.setFloat2Parameter)
$(lift 'G.setFloat3Parameter)
$(lift 'G.setFloat4Parameter)
$(lift 'G.setVector2Parameter)
$(lift 'G.setVector3Parameter)
$(lift 'G.setColorParameter)
$(lift 'G.setTransformParameter)
$(lift 'G.setTextureParameter)
$(lift 'G.setCurrentTextureParameter)
$(lift 'G.bind)
$(lift 'G.isShaderAvailable)

-- * Graphics / Shape.hs
$(liftWithDestroy 'id 'G.createShape)
$(lift 'G.updateShape)

-- * Graphics / Sprite.hs
$(liftWithDestroy 'G.err 'G.createSprite)
$(lift 'G.setColor)
$(lift 'G.getColor)

-- * Graphics / Text.hs
$(liftWithDestroy 'G.err 'G.createText)
$(lift 'G.setTextString)
$(lift 'G.setTextStringU)
$(lift 'G.setTextFont)
$(lift 'G.setTextCharacterSize)
$(lift 'G.setTextStyle)
$(lift 'G.setTextColor)
$(lift 'G.getTextString)
$(lift 'G.getTextUnicodeString)
$(lift 'G.getTextFont)
$(lift 'G.getTextCharacterSize)
$(lift 'G.getTextStyle)
$(lift 'G.getTextColor)
$(lift 'G.findTextCharacterPos)
$(lift 'G.getTextLocalBounds)
$(lift 'G.getTextGlobalBounds)

-- * Graphics / Texture.hs
$(liftWithDestroy 'G.err 'G.createTexture)
$(liftWithDestroy 'G.err 'G.textureFromFile)
$(liftWithDestroy 'G.err 'G.textureFromMemory)
$(liftWithDestroy 'G.err 'G.textureFromStream)
$(liftWithDestroy 'G.err 'G.textureFromImage)
$(lift 'G.textureSize)
$(lift 'G.copyTextureToImage)
$(lift 'G.updateTextureFromPixels)
$(lift 'G.updateTextureFromImage)
$(lift 'G.updateTextureFromWindow)
$(lift 'G.updateTextureFromRenderWindow)
$(lift 'G.setRepeated)
$(lift 'G.isRepeated)

-- * Graphics / VertexArray.hs
$(liftWithDestroy 'id 'G.createVA)
$(lift 'G.getVertexCount)
$(lift 'G.getVertex)
$(lift 'G.clearVA)
$(lift 'G.resizeVA)
$(lift 'G.appendVA)
$(lift 'G.setPrimitiveType)
$(lift 'G.getPrimitiveType)
$(lift 'G.getVABounds)

-- * Graphics / View.hs
$(liftWithDestroy 'id 'G.createView)
$(lift 'G.viewFromRect)
$(lift 'G.copyView)
$(lift 'G.setViewCenter)
$(lift 'G.setViewSize)
$(lift 'G.setViewRotation)
$(lift 'G.setViewport)
$(lift 'G.resetView)
$(lift 'G.getViewCenter)
$(lift 'G.getViewSize)
$(lift 'G.getViewRotation)
$(lift 'G.getViewViewport)
$(lift 'G.moveView)
$(lift 'G.rotateView)
$(lift 'G.zoomView)

-- * System / Clock.hs
$(liftWithDestroy 'id 'S.createClock)
$(lift 'S.getElapsedTime)
$(lift 'S.restartClock)

-- * System / Sleep.hsc
$(lift 'S.sfSleep)


-- * Window / Context.hsc
$(liftWithDestroy 'id 'W.createContext)
$(lift 'W.setActiveContext)

-- * Window / Joystick.hs
$(lift 'W.isJoystickConnected)
$(lift 'W.getButtonCount)
$(lift 'W.hasAxis)
$(lift 'W.isJoystickButtonPressed)
$(lift 'W.getAxisPosition)
$(lift 'W.updateJoystick)

-- * Window / Keyboard.hs
$(lift 'W.isKeyPressed)

-- * Window / Mouse.hs
$(lift 'W.isMouseButtonPressed)

-- * Window / VideoMode.hs
$(lift 'W.getDesktopMode)
$(lift 'W.getFullscreenModes)
$(lift 'W.isValid)

-- * Window / Window.hsc
$(liftWithDestroy 'id 'W.createWindow)
$(liftWithDestroy 'id 'W.windowFromHandle)
