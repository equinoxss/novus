#= require_tree nv
#= require common
#= require nub
#= require gleam
#= require debug
#= require assets
#= require controllers
#= require renderers

$(() ->
  # Setup network connection
  # connection = nub()

  # id = Math.random()
  # id = "Dan#{id}"
  # connection.auth id

  # connection.on 'asdf', (event) ->
  #   if event.userId isnt id
  #     glcanvas.addDrawable new nv.assets.Ship

  # connection.send 'asdf',
  #   userId: id
  #   something: 'herro'

  # Setup gl canvas
  glcanvas = gl 'canvas'

  glcanvas.size 500, 500
  glcanvas.background '#000'

  glcanvas.fullscreen()

  bg = new nv.assets.Background
  bg2 = new nv.assets.Background
  ship = new nv.assets.Ship
  asteroid = new nv.assets.Asteroid(500,500)
  asteroid2 = new nv.assets.Asteroid(500, 500)
  asteroid3 = new nv.assets.Asteroid(500, 500)

  asteroidController = new nv.controllers.AsteroidController [asteroid, asteroid2, asteroid3]
  shipController = new nv.controllers.ShipController ship
  bulletController = new nv.controllers.BulletController []

  controllers = [bulletController, asteroidController, shipController]

  bgRenderer = new nv.renderers.BackgroundRenderer(glcanvas, bg)
  bg2Renderer = new nv.renderers.BackgroundRenderer(glcanvas, bg2)
  shipRenderer = new nv.renderers.ShipRenderer(glcanvas, ship)
  asteroidRenderer = new nv.renderers.AsteroidRenderer(glcanvas, [asteroid, asteroid2, asteroid3])

  renderers = [bgRenderer, bg2Renderer, shipRenderer, asteroidRenderer]

  gamepad = nv.gamepad()
  gamepad.aliasKey 'left', nv.Key.A
  gamepad.aliasKey 'right', nv.Key.D
  gamepad.aliasKey 'up', nv.Key.W
  gamepad.aliasKey 'down', nv.Key.S

  gamepad.aliasKey 'shoot', nv.Key.Spacebar

  speed = 5
  shootDelay = 10

  update = (dt) ->
    controller.update(dt, gamepad) for controller in controllers

    # Boundary Wrapping
    dimensions = glcanvas.size()

    bg.x = -ship.x * 0.05
    bg.y = -ship.y * 0.05

    bg2.x = -ship.x * 0.01
    bg2.y = -ship.y * 0.01

  glcanvas.camera = nv.camera()
  glcanvas.camera.follow ship, 250, 250
  glcanvas.camera.zoom 0.5
  glcanvas.camera.zoom 1, 2000

  glcanvas.startDrawUpdate 60, update
)