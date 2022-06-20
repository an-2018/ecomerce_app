import fs from 'fs'

const saveToDB = (dbMock, type) => {
    fs.writeFileSync(`./src/database/${type ? type : 'db'}.json`, JSON.stringify(dbMock, null, 2), { encoding: "utf-8" })
}

export default saveToDB