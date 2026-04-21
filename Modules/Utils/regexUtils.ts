/**
 * Regex Test Utility
 * @param pattern Regular expression string
 * @param flags Flags (g, i, m, etc.)
 * @param text Text to test
 * @returns Result object with matches or error
 */
export const testRegex = (pattern: string, flags: string, text: string) => {
  if (!pattern) return null
  
  try {
    const regex = new RegExp(pattern, flags)
    const matches = []
    let match
    
    if (!flags.includes('g')) {
      match = regex.exec(text)
      if (match) matches.push(match)
    } else {
      let lastIndex = -1
      while ((match = regex.exec(text)) !== null) {
        if (regex.lastIndex === lastIndex) break
        lastIndex = regex.lastIndex
        matches.push(match)
      }
    }
    
    return {
      success: true,
      matches: matches.map(m => ({
        value: m[0],
        index: m.index,
        groups: m.slice(1)
      }))
    }
  } catch (error: any) {
    return {
      success: false,
      error: error.message
    }
  }
}
