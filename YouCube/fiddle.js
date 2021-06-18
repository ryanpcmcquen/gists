// custom date function to display a date in MM/DD/YYYY format
Date.prototype.shortFormat = function () {
    return (this.getMonth() + 1) + "/" + this.getDate() + "/" + this.getFullYear();
};

// Blog object constructor
function Blog(body, date, image) {
    // assign the properties
    this.body = body;
    this.date = date;
    this.image = image;
}

// return a string representation of the blog entry
Blog.prototype.toString = function () {
    return "[" + this.date.shortFormat() + "]" + this.body;
};

// return a formatted html representation of the blog entry
Blog.prototype.toHTML = function (highlight) {
    // use a gray background as a highlight, if specified
    var blogHTML = "";
    blogHTML += highlight ? "<p style='background-color: #eeeeee;'>" : "<p>";

    // generate the formatted blog html code
    if (this.image) {
        blogHTML += "<strong>" + this.date.shortFormat() + "</strong><br><table><tr><td><img src='" + "https://raw.githubusercontent.com/ryanpcmcquen/headFirstJavascriptCode/master/JS%20examples/chapter12/youcube/" + this.image + "'></td><td style='vertical-align: top;'>" + this.body + "</td></tr></table><em>" + this.signature + "</em></p>";
    } else {
        blogHTML += "<strong>" + this.date.shortFormat() + "</strong><br>" + this.body + "<br><em>" + this.signature + "</em></p>";
    }
    return blogHTML;
};

// see if the blog body contains a string of text
Blog.prototype.containsText = function (text) {
    return (this.body.toLowerCase().indexOf(text.toLowerCase()) !== -1);
};

// set the blog-wide signature
Blog.prototype.signature = "by Puzzler Ruby";

// sort helper to sort blog entries in reverse chronological order (most recent first)
Blog.blogSorter = function (blog1, blog2) {
    return blog2.date - blog1.date;
};

// global array of blog entries
var blog = [];

// global ajax request
var ajaxReq = new AjaxRequest();

// load the blog from an xml doc on the server using ajax
function loadBlog() {
    document.getElementById("blog").innerHTML = "<img src='https://raw.githubusercontent.com/ryanpcmcquen/headFirstJavascriptCode/master/JS%20examples/chapter12/youcube/wait.gif' alt='Loading ...'>";
    ajaxReq.send("GET", "https://cdn.rawgit.com/ryanpcmcquen/headFirstJavascriptCode/30412cacf5f1b341bb4cf0e32b88216adad367b5/JS%20examples/chapter12/youcube/blog.xml", handleRequest);
}

// handle the ajax request
function handleRequest() {
    if (ajaxReq.getReadyState() === 4 && ajaxReq.getStatus() === 200) {
        // store the xml response data
        var xmlData = ajaxReq.getResponseXML().getElementsByTagName("blog")[0];

        // set the blog-wide signature
        Blog.prototype.signature = "by " + getText(xmlData.getElementsByTagName("author")[0]);

        // create the array of Blog entry objects
        var entries = xmlData.getElementsByTagName("entry");
        for (var i = 0; i < entries.length; i++) {
            // create the blog entry
            blog.push(new Blog(getText(entries[i].getElementsByTagName("body")[0]),
            new Date(getText(entries[i].getElementsByTagName("date")[0])),
            getText(entries[i].getElementsByTagName("image")[0])));
        }

        // enable the blog buttons
        document.getElementById("search").disabled = false;
        document.getElementById("showall").disabled = false;
        document.getElementById("viewrandom").disabled = false;

        // show the blog
        showBlog(5);
    }
}

// show the list of blog entries
function showBlog(numEntries) {
    // first sort the blog
    blog.sort(Blog.blogSorter);

    // adjust the number of entries to show the full blog, if necessary
    if (!numEntries) numEntries = blog.length;

    // show the blog entries
    var i = 0,
        blogListHTML = "";
    while (i < blog.length && i < numEntries) {
        blogListHTML += blog[i].toHTML(i % 2 === 0);
        i++;
    }

    // set the blog html code on the page
    document.getElementById("blog").innerHTML = decodeURIComponent(blogListHTML);
}

// search the list of blog entries for a piece of text
function searchBlog() {
    var searchText = document.getElementById("searchtext").value;
    for (var i = 0; i < blog.length; i++) {
        // see if the blog entry contains the search text
        if (blog[i].containsText(searchText)) {
            alert(blog[i]);
            break;
        }
    }

    // if the search text wasn't found, display a message
    if (i === blog.length) alert("Sorry, there are no blog entries containing the search text.");
}

// display a randomly chosen blog entry
function randomBlog() {
    // pick a random number between 0 and blog.length - 1
    var i = Math.floor(Math.random() * blog.length);
    alert(blog[i]);
}

// get the text content of an html element
function getText(elem) {
    var text = "";
    if (elem) {
        if (elem.childNodes) {
            for (var i = 0; i < elem.childNodes.length; i++) {
                var child = elem.childNodes[i];
                if (child.nodeValue) text += child.nodeValue;
                else {
                    if (child.childNodes[0]) if (child.childNodes[0].nodeValue) text += child.childNodes[0].nodeValue;
                }
            }
        }
    }
    return text;
}