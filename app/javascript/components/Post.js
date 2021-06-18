import React from 'react'
import PropTypes from 'prop-types'

const Post = (props) => {
  const { id, title, body } = props

  const handleDelete = (id) => {
    delete(`/api/v1/posts/${id}`)
  }

  return (
    <tr>
      <td>{title}</td>
      <td>{body}</td>
      <td><button onClick={() => handleClick(id)}>삭제</button></td>
    </tr>
  )
}

Post.propTypes = {
  id: PropTypes.number,
  title: PropTypes.string,
  body: PropTypes.string
}

export default Post
