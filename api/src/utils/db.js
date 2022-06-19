import fs from 'fs'

const saveToDB = (dbMock) => {
    fs.writeFileSync('./src/database/db.json', JSON.stringify(dbMock, null, 2), { encoding: "utf-8" })
}

export default saveToDB