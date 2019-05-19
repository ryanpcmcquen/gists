const timeConversion = (s) => {
    const hours = s.slice(0, 2)
    const meridiem = s.slice(-2)
    switch (true) {
        case hours === '12' && meridiem === 'AM':
            return `00${s.slice(2, -2)}`
        case meridiem === 'PM' && hours !== '12':
            return `${Number(hours) + 12}${s.slice(2, -2)}`
        case hours === '12' && meridiem === 'PM':
        default:
            return s.slice(0, -2)
    }
}