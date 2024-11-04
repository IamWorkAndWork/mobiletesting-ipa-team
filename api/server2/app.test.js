const request = require('supertest')
const app = require('./app')

describe('GET user point', () => {
  it('200', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/point')
      .set('Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9')

    // Assert
    expect(response.status).toBe(200)
    expect(response.body).toEqual({
      point: 100,
    })
    expect(response.header.authorization).toEqual(
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
    )
  })
  it('200', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/point')
      .set('Authorization', 'Bearer eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9')

    // Assert
    expect(response.status).toBe(200)
    expect(response.body).toEqual({
      point: 200,
    })
    expect(response.header.authorization).toEqual(
      'Bearer eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9'
    )
  })
  it('401 Unauthorised WHEN authToken is invalid token', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/point')
      .set('Authorization', 'Bearer token')

    // Assert
    expect(response.status).toBe(401)
    expect(response.body).toEqual({ error: 'Unauthorised' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('400  WHEN authToken is invalid format', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/point')
      .set('Authorization', 'Bearer11111')

    // Assert
    expect(response.status).toBe(400)
    expect(response.body).toEqual({ error: 'Invalid request' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('401 Unauthorised WHEN authToken is absent', async () => {
    // Act
    const response = await request(app).get('/v1/api/user/point')

    // Assert
    expect(response.status).toBe(401)
    expect(response.body).toEqual({ error: 'Unauthorised' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('400 WHEN authToken is empty string', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/point')
      .set('Authorization', '')

    // Assert
    expect(response.status).toBe(400)
    expect(response.body).toEqual({ error: 'Invalid request' })
    expect(response.header.authorization).toBeUndefined()
  })
  afterAll((done) => {
    app.close()
    done()
  })
})
describe('GET user tier', () => {
  it('200', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/tier')
      .set('Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9')

    // Assert
    expect(response.status).toBe(200)
    expect(response.body).toEqual({
      tier: 'bronze',
    })
    expect(response.header.authorization).toEqual(
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
    )
  })
  it('200', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/tier')
      .set('Authorization', 'Bearer eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9')

    // Assert
    expect(response.status).toBe(200)
    expect(response.body).toEqual({
      tier: 'silver',
    })
    expect(response.header.authorization).toEqual(
      'Bearer eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9'
    )
  })
  it('401 Unauthorised WHEN authToken is invalid token', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/tier')
      .set('Authorization', 'Bearer token')

    // Assert
    expect(response.status).toBe(401)
    expect(response.body).toEqual({ error: 'Unauthorised' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('400  WHEN authToken is invalid format', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/tier')
      .set('Authorization', 'Bearer11111')

    // Assert
    expect(response.status).toBe(400)
    expect(response.body).toEqual({ error: 'Invalid request' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('401 Unauthorised WHEN authToken is absent', async () => {
    // Act
    const response = await request(app).get('/v1/api/user/tier')

    // Assert
    expect(response.status).toBe(401)
    expect(response.body).toEqual({ error: 'Unauthorised' })
    expect(response.header.authorization).toBeUndefined()
  })
  it('400 WHEN authToken is empty string', async () => {
    // Act
    const response = await request(app)
      .get('/v1/api/user/tier')
      .set('Authorization', '')

    // Assert
    expect(response.status).toBe(400)
    expect(response.body).toEqual({ error: 'Invalid request' })
    expect(response.header.authorization).toBeUndefined()
  })
  afterAll((done) => {
    app.close()
    done()
  })
})
