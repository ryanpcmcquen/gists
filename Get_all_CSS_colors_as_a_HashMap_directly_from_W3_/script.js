document.addEventListener('DOMContentLoaded', async () => {
    const w3_color_page = await fetch('https://www.w3.org/TR/css-color-4/');

    const parser = new DOMParser();
    const new_doc = parser.parseFromString(
        await w3_color_page.text(),
        'text/html'
    );

    const color_table_rows = Array.from(
        new_doc.querySelectorAll('.named-color-table tr')
    );

    const color_names = color_table_rows.slice(1).reduce((acc, row) => {
        acc[row.querySelector('th').textContent.trim()] = row
            .querySelector('td:nth-child(4)')
            .textContent.trim();
        return acc;
    }, {});

    console.log(color_names);

    document.querySelector('.css_color_map').textContent =
        JSON.stringify(color_names, null, '\t');
});
