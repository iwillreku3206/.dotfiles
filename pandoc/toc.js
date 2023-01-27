const process = require('process')
let toc = '\\<ol\\>'

function countHashtags(str) {
  var count = 0;
  for (var i = 0; i < str.length; i++) {
    if (str.charAt(i) === '#') {
      count++;
    } else if (str.charAt(i) === ' ') {
      break;
    }
  }
  return count;
}


// taken from `markdown-toc` package
function slugify(str) {
  str = str.toLowerCase();

  // `.split()` is often (but not always) faster than `.replace()`
  str = str.split(' ').join('-');
  str = str.split(/\t/).join('--');
  str = str.split(/[|$&`~=\\\/@+*!?({[\]})<>=.,;:'"^]/).join('');
  str = str.split(/[。？！，、；：“”【】（）〔〕［］﹃﹄“ ”‘’﹁﹂—…－～《》〈〉「」]/).join('');
  str = replaceDiacritics(str);
  return str;
};

function replaceDiacritics(str) {
  return str.replace(/[À-ž]/g, function(ch) {
    return diacritics[ch] || ch;
  });
}

// javascript function to get the section number in this format given a list of headings: a.b.c.d.e.f


process.stdin.once('data', (d) => {
  const lines = d.toString().split('\n')
  const toplevel = lines.map(ln => countHashtags(ln)).filter(a => a !== 0).sort()[0]
  let level = toplevel
  let levels = Array(6).fill(0)
  lines.forEach((h, idx) => {
    if (!h.startsWith('#')) return
    const hl = countHashtags(h)
    if (level > hl) {
      toc += `\\<\\/ol\\>\\<\\/li\\>`
      levels[hl] = 0
      levels[level - 1] = 0
    }
    if (level < hl) {
      toc += `\\<ol\\>`
    }
    if (hl == 1 && levels[0] == 1) {
      toc += '\\<\\/ol\\>'
    }
    levels[hl - 1]++
    level = hl
    toc += `\\<li bullet=\\"${levels.slice(0, hl).join('\\.')}\\. \\"\\>\\<a href=\\"#${slugify(h.split(' ').slice(1).join(' '))}\\"\\>${h.split(' ').slice(1).join(' ')}\\<\\/a\\>`
    if (!countHashtags(lines[idx] || '') > level) {
      toc += `\\<\\/li\\>`
    }
  })
  toc += Array(level).fill('\\<\\/ol\\>').join('')
  console.log(toc)
  process.exit()
})
