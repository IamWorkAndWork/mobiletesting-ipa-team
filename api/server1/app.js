const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const http = require('node:http')
const port = 3000

const authToken = {
  132495: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
  243596: 'eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9',
  987123: 'rr4RIu-hZkeryZRXK7dEwquQn4rVGqZFEmKWwuR_kYs',
}
const users = {
  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9: {
    name: 'John Doe',
    email: 'john.doe@example.com',
  },
  eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9: {
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
  },
  'rr4RIu-hZkeryZRXK7dEwquQn4rVGqZFEmKWwuR_kYs': {
    name: 'Patties Brown',
    email: 'pat@example.com',
  },
}

app.use(bodyParser.json())
// พบระเบิด ณ workshop#5. workshop#4 - call api จะทำเเค่ flutter app
app.post('/api/v1/pin/validate', (req, res) => {
  const pin = req.body.pin
  // const pin = req.body.body //hidden bug for scenario#2
  console.log(`req.body + ${JSON.stringify(req.body)}`)
  if (pin === undefined || pin === null || pin === '') {
    res.status(400).json({ error: 'Invalid request' })
    console.log('400')
  } else if (authToken[pin] === undefined) {
    res.status(401).json({ error: 'Unauthorised' })
    console.log('401 ja')
  } else {
    res.setHeader('Authorization', 'Bearer ' + authToken[pin])
    res.status(200).json()
    console.log('200 ja')
  }
})

// พบระเบิด ณ workshop#5. workshop#4 - call api จะทำเเค่ flutter app
app.get('/api/v1/user', (req, res) => {
  if (req.headers.authorization == undefined) {
    res.status(401).json({ error: 'Unauthorised' })
    return
  }

  const authToken = req.headers.authorization.split(' ')[1]
  console.log(`authToken: ${authToken}`)
  if (authToken === undefined || authToken === '') {
    res.status(400).json({ error: 'Invalid request' })
  } else if (users[authToken] === undefined) {
    res.status(401).json({ error: 'Unauthorised' })
  } else {
    res.setHeader('Authorization', req.headers.authorization)
    res.status(200).json(users[authToken])
  }
})

var server = app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`)
})
module.exports = server
